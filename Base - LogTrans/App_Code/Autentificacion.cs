using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

public static class Autentificacion
{
    public static bool Autenticar(string usuario, string password)
    {

        {
            int count = 0;

            RVEntities modelo = new RVEntities();
            RVuser users = modelo.RVuser.Where(x => x.user == usuario && x.password == password).FirstOrDefault();
            if (users != null)
            {
                count = 1;
                string usuarioRV = users.user;
                string claveRV = users.password;
            }
            else
            {
                count = 0;
            }
            if (count == 0) { return false; } else { return true; }

            #region obsoleto
            //switch (usuario)
            //{
            //    case "MPacheco":
            //        if (password == "mpmersan") { count = 1; } else { count = 0; }
            //        break;

            //    case "yburguillos":
            //        if (password == "ybmersan") { count = 1; } else { count = 0; }
            //        break;
            //    ////////////////////////////////////////////////////////////////////////  USUARIOS GENERAL PARA LOS DEPARTAMENTO ////
            //    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            //    case "Desarrollo":
            //        if (password == "desarrollo.aspx") { count = 1; } else { count = 0; }
            //        break;
            //    case "Ventas":
            //        if (password == "vmersan") { count = 1; } else { count = 0; }
            //        break;
            //    case "Compras":
            //        if (password == "cmersan") { count = 1; } else { count = 0; }
            //        break;
            //    case "Inventario":
            //        if (password == "imersan") { count = 1; } else { count = 0; }
            //        break;
            //    case "Produccion":
            //        if (password == "pmersan") { count = 1; } else { count = 0; }
            //        break;
            //    case "Finanza":
            //        if (password == "fmersan0a") { count = 1; } else { count = 0; }
            //        break;
            //    case "Mantenimiento":
            //        if (password == "mmersan") { count = 1; } else { count = 0; }
            //        break;
            //    ////////////////////////////////////////////////////////////////////////  USUARIOS DE MERSAN ////////////////////////
            //    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            //    case "ayaizeth":
            //        if (password == "ayaizeth") { count = 1; } else { count = 0; }
            //        break;
            //    case "acarrer":
            //        if (password == "acarrer") { count = 1; } else { count = 0; }
            //        break;
            //    case "jsanchez":
            //        if (password == "jsanchez") { count = 1; } else { count = 0; }
            //        break;

            //    case "mhernandez":
            //        if (password == "mhernandez") { count = 1; } else { count = 0; }
            //        break;

            //    case "rcolmenares":
            //        if (password == "rcomenares") { count = 1; } else { count = 0; }
            //        break;

            //    case "egarcia":
            //        if (password == "egarcia") { count = 1; } else { count = 0; }
            //        break;

            //    case "cmendoza":
            //        if (password == "cmendoza") { count = 1; } else { count = 0; }
            //        break;

            //    case "dperdomo":
            //        if (password == "dperdomo") { count = 1; } else { count = 0; }
            //        break;

            //    case "llovera":
            //        if (password == "llovera") { count = 1; } else { count = 0; }
            //        break;

            //    case "mdiaz":
            //        if (password == "mdiaz") { count = 1; } else { count = 0; }
            //        break;

            //    case "mlaura":
            //        if (password == "mlaura") { count = 1; } else { count = 0; }
            //        break;

            //    case "mnuñez":
            //        if (password == "mnuñez") { count = 1; } else { count = 0; }
            //        break;

            //    case "mmujica":
            //        if (password == "mmujica") { count = 1; } else { count = 0; }
            //        break;

            //    case "mtovar":
            //        if (password == "mtovar") { count = 1; } else { count = 0; }
            //        break;
            //    ////////////////////////////////////////////////////////////////////////  USUARIOS DE ALMACEN BARUTA ////////////////
            //    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            //    case "almacen":
            //        if (password == "almacen") { count = 1; } else { count = 0; }
            //        break;
            //    ////////////////////////////////////////////////////////////////////////  USUARIOS SMART TV /////////////////////////
            //    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            //    case "SmartTV":
            //        if (password == "a") { count = 1; } else { count = 0; }
            //        break;
            //    case "A-SmartTV":
            //        if (password == "a") { count = 1; } else { count = 0; }
            //        break;
            //    case "B-SmartTV":
            //        if (password == "a") { count = 1; } else { count = 0; }
            //        break;
            //    case "a":
            //        if (password == "a") { count = 1; } else { count = 0; }
            //        break;
            //    case "SmartTv":
            //        if (password == "a") { count = 1; } else { count = 0; }
            //        break;
            //    ////////////////////////////////////////////////////////////////////////  USUARIOS DE BARUTA /////////////////////////
            //    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            //    case "ysantana":
            //        if (password == "ysmersan") { count = 1; } else { count = 0; }
            //        break;

            //    case "mpinto":
            //        if (password == "mpinto") { count = 1; } else { count = 0; }
            //        break;

            //    case "rfuentes":
            //        if (password == "rfuentes") { count = 1; } else { count = 0; }
            //        break;
            //    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            //    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            //}
            #endregion
        }
    }
}