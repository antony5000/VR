using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    UserCalender c = new UserCalender();
    protected void Page_Load(object sender, EventArgs e)
    {
        //DateTime date1 = new DateTime(2015, 1, 1, 0, 0, 0);
        //DateTime date2 = new DateTime(2015, 7, 3, 0, 0, 0);
        ////UserCalender.PosicionCalendario("36", date1, date2);
        //c.EliminarTabla();
        //c.CicloCalendario();
    }
    protected void IniciarSesion_Click(object sender, EventArgs e)
    {
        string usuario = Request.Form.Get("txtuser");
        string contraseña = Request.Form.Get("txtpassword");
        
        if (Autentificacion.Autenticar(usuario, contraseña))
        {
            
            FormsAuthentication.RedirectFromLoginPage(usuario, true);
            this.Session.Add("usuarioActivo", usuario);
           
        }
        else { }
    }
}