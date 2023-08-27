using CarpinteriaApp_1w3.Presentacion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CarpinteriaApp_1w3
{
    internal static class Program
    {
        /// <summary>
        /// Punto de entrada principal para la aplicación.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            //Application.Run(new FrmPrincipal()); // Para que  arranque en la principal
            Application.Run(new FrmNuevoPresupuesto()); // Para que arranque en la de presupuesto directamente

        }
    }
}
