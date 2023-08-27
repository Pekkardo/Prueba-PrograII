using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarpinteriaApp_1w3.Entidades
{
    internal class Presupuesto
    {
        public int PresupuestoNro { get; set; }
        public DateTime Fecha { get; set; }
        public string Cliente { get; set; }
        public double CostoMO { get; set; }
        public double Descuento { get; set; }
        public DateTime FechaBaja { get; set; }
        public List<DetallePresupuesto> Detalles { get; set; } //CADA PRESUPUESTO VA A TENER UNA LISTA DE DETALLES
        public Presupuesto()
        {
            Detalles = new List<DetallePresupuesto>();
        }
        public void AgregarDetalle(DetallePresupuesto detalle) // RECIBE UN DETALLE Y HACE UN ADD
        {
            Detalles.Add(detalle);
        }
        public void QuitarDetalle(int posicion) // RECIBE UNA POSICION Y LO ELIMINA DE LA LISTA
        {
            Detalles.RemoveAt(posicion);
        }
        public double CalcularTotal() // SE PUEDE HACER DE LAS DOS FORMAS- POR CADA DETALLE QUE TRAE UN SUBTOTAL SE SUMA Y SE HACE UN TOTAL
        {
            double total = 0;
            // Con For -------------------------------------

            //for (int i = 0; i < Detalles.Count; i++)
            //{
            //    total += Detalles[i].CalcularSubtotal();
            //}

            // Con Foreach --------------------------------

            foreach (DetallePresupuesto d in Detalles)
            {
                total += d.CalcularSubtotal();
            }
            return total;
        }
    }
}
