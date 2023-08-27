using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using CarpinteriaApp_1w3.Entidades;

namespace CarpinteriaApp_1w3.Presentacion
{
    public partial class FrmNuevoPresupuesto : Form
    {
        Presupuesto nuevo;
        public FrmNuevoPresupuesto()
        {
            InitializeComponent();
            nuevo = new Presupuesto();
        }

        private void FrmNuevoPresupuesto_Load(object sender, EventArgs e)
        {
            ProximoPresupuesto();
            CargarProducto();
            txtFecha.Text = DateTime.Today.ToShortDateString(); // Se carga el dia de hoy, solamente el dia, se muestra solamente el dia de hoy 
            txtCliente.Text = "Consumidor Final";
            txtDescuento.Text = "0";
            txtCantidad.Text = "1";
        }

        private void CargarProducto()
        {
            SqlConnection conexion = new SqlConnection();
            conexion.ConnectionString = @"Data Source=172.16.10.196;Initial Catalog=Carpinteria_2023;Persist Security Info=True;User ID=alumno1w1; Password=alumno1w1 ";
            conexion.Open();
            SqlCommand comando = new SqlCommand();
            comando.Connection = conexion;
            comando.CommandType = CommandType.StoredProcedure; //Le decimos que es un Procedimiento Almacenad
            comando.CommandText = "SP_CONSULTAR_PRODUCTOS";
            DataTable tabla = new DataTable();
            tabla.Load(comando.ExecuteReader());
            conexion.Close();

            cboProducto.DataSource = tabla;
            cboProducto.ValueMember = tabla.Columns[0].ColumnName;
            cboProducto.DisplayMember= tabla.Columns[1].ColumnName;
        }

        private void ProximoPresupuesto()
        {
            SqlConnection conexion = new SqlConnection();
            conexion.ConnectionString = @"Data Source=172.16.10.196;Initial Catalog=Carpinteria_2023;Persist Security Info=True;User ID=alumno1w1; Password=alumno1w1 ";
            conexion.Open();
            SqlCommand comando = new SqlCommand();
            comando.Connection= conexion;
            comando.CommandType = CommandType.StoredProcedure; //Le decimos que es un Procedimiento Almacenad
            comando.CommandText = "SP_PROXIMO_ID";
            SqlParameter parametro = new SqlParameter();//Porque devuelve un parametro de salida se configura como un parametro de salida
            parametro.ParameterName = "@next"; // Nombre de la variable, lo que devuelve el PA
            parametro.SqlDbType = SqlDbType.Int; //Establecer tipo de dato que trae el PA
            parametro.Direction = ParameterDirection.Output;
            comando.Parameters.Add(parametro);//Es el comando el que usa el parametro 
            comando.ExecuteNonQuery();

            lblPresupuestoNro.Text = lblPresupuestoNro.Text+ " " + parametro.Value.ToString(); // .Value es para mostrar el valor del parametro --  Se concatena el texto que dice numero de parametro con lo que devuelve el PA 


            conexion.Close();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            if (cboProducto.SelectedIndex == -1)
            {
                MessageBox.Show("Debe seleccionar un producto", "Control", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }
            if(string.IsNullOrEmpty(txtCantidad.Text)||!int.TryParse(txtCantidad.Text, out _)) // Si puede comvertirlo en un entero un int es porque hay un numero 
            {
                MessageBox.Show("Debe ingresar una cantidad valida", "Control", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }
            foreach (DataGridViewRow Fila in dgvDetalles.Rows) //Para cada fila en la grilla se 
            {
                if (Fila.Cells["ColProducto"].Value.ToString().Equals(cboProducto.Text))
                {
                    MessageBox.Show("Este producto ya esta presupuestado", "Control", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    return;
                }
            }
            DataRowView item = (DataRowView)cboProducto.SelectedItem; //Fila seleccionada en el combo, se usa DataRowView porque tengo un producto, no una lista 
            int nro = Convert.ToInt32(item.Row.ItemArray[0]);
            string nom = item.Row.ItemArray[1].ToString(); //La columna uno trae el nombre por lo que se muestra, osea ToString
            double pre = Convert.ToDouble(item.Row.ItemArray[2]);
            Producto p= new Producto(nro, nom, pre); // Aca se crea el producto

            int cant = Convert.ToInt32(txtCantidad.Text);
            DetallePresupuesto detalle = new DetallePresupuesto(p,cant);

            nuevo.AgregarDetalle(detalle); // Se agrega manualmente columna por columna porque no le gusta como le damos las columnas, se puee hacer tambien por un array 
            dgvDetalles.Rows.Add(detalle.Producto.ProductoNro,
                                 detalle.Producto.Nombre,
                                 detalle.Producto.Precio,
                                 detalle.Cantidad,
                                 "Quitar");
            CalcularDetalles();
        }

        private void CalcularDetalles()
        {
            txtSubTotal.Text = nuevo.CalcularTotal().ToString();
            if (!string.IsNullOrEmpty(txtDescuento.Text) && int.TryParse(txtDescuento.Text, out _)) // Si se puede calcular y se puede pasar a int
            {
                double dto= nuevo.CalcularTotal() * Convert.ToDouble(txtDescuento.Text) / 100;
                txtTotal.Text = (nuevo.CalcularTotal() - dto).ToString();
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if(dgvDetalles.CurrentCell.ColumnIndex== 4) //Quito la de la posicion a la que le hago click, a el index 
            {
                nuevo.QuitarDetalle(dgvDetalles.CurrentRow.Index);
                dgvDetalles.Rows.RemoveAt(dgvDetalles.CurrentRow.Index);
                CalcularTotal();
            }
        }
    }
}
