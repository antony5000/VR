using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    string Path = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        
        ReportViewerRV.ZoomPercent = 80;
        if (Session["usuarioActivo"] == null) {
            Cerrar_Click(sender,e);
        } else {
            string UsuarioActivo = Session["usuarioActivo"].ToString();
            LbUsuario.Text = UsuarioActivo;
        }
        if (LbUsuario.Text.ToString() == "temp") { ReportViewerRV.ZoomPercent = 50; }
        #region Asignar Roles
        string UsuarioA= Session["usuarioActivo"].ToString();        
        RVEntities modelo = new RVEntities();
        RVuser users = modelo.RVuser.Where(x => x.user == UsuarioA).FirstOrDefault();

        string perfil = users.idProfile;

        perfil = perfil.Replace(" ","");

        switch (perfil)
        {
            #region Compras
            case "compL1":
            //pnCompra.Visible = true;
            //pnCompraI.Visible = true;
            break;

            case "compL2":
            //pnCompra.Visible = true;
            //pnCompraI.Visible = true;
            //pnCompraII.Visible = true;
            break;
            #endregion

            //#region Ventas
            //case "ventL1":
            //pnVenta.Visible = true;
            //pnVentaI.Visible = true;
            //break;
            //case "ventL2":
            //pnVenta.Visible = true;
            //pnVentaI.Visible = true;
            //pnVentaII.Visible = true;
            //break;
            //#endregion

            #region Inventario
            case "inveL1":
            pnInv.Visible = true;
            //pnInvI.Visible = true;
            break;
            
            case "inveL2":
            pnInv.Visible = true;
            //pnInvI.Visible = true;
            pnInvII.Visible = true;
            break;
            #endregion

            //#region Produccion
            //case "prodL1":
            //pnProd.Visible = true;
            //pnProdI.Visible = true;
            //break;

            //case "prodL2":
            //pnProd.Visible = true;
            //pnProdI.Visible = true;
            //pnProdII.Visible = true;
            //break;

            //case "prodL3":
            //pnProd.Visible = true;
            //pnProdI.Visible = true;
            //pnProdII.Visible = true;
            //pnProdIII.Visible = true;
            //pnProIV.Visible = true;
            //break;
            //#endregion

            #region Hiper Usuario
            case "hip":
            //pnCompra.Visible = true;
            //pnCompraI.Visible = true;

            //pnVenta.Visible = true;
            //pnVentaI.Visible = true;

            pnInv.Visible = true;
            //pnInvI.Visible = true;
            pnInvII.Visible = true;

            //pnProd.Visible = true;
            //pnProdI.Visible = true;
            //pnProdII.Visible = true;
            //pnProdIII.Visible = true;
            //pnProIV.Visible = true;
            break;
            #endregion

            #region Super Usuario
            case "sup":
            //pnCompra.Visible = true;
            //pnCompraI.Visible = true;

            //pnVenta.Visible = true;
            //pnVentaI.Visible = true;

            pnInv.Visible = true;
            //pnInvI.Visible = true;
            pnInvII.Visible = true;

            //pnProd.Visible = true;
            //pnProdI.Visible = true;
            //pnProdII.Visible = true;
            //pnProdIII.Visible = true;
            //pnProIV.Visible = true;
            break;
            #endregion

            #region Super Usuario (Inventario - Produccion)
            case "supInvPro":
            pnInv.Visible = true;
            //pnInvI.Visible = true;
            pnInvII.Visible = true;

            //pnProd.Visible = true;
            //pnProdI.Visible = true;
            //pnProdII.Visible = true;
            //pnProdIII.Visible = true;
            //pnProIV.Visible = true;
            break;
            #endregion

           #region Super Usuario (Inventario -  Despacho)
            case "supInvDes":
            pnInv.Visible = true;
            //pnInvI.Visible = true;
            pnInvII.Visible = true;

            //pnVenta.Visible = true;
            //pnVentaI.Visible = true;
            break;
            #endregion
        }
        #endregion 

        if (!IsPostBack)
        {

            Microsoft.Reporting.WebForms.IReportServerCredentials icredenteials = new Reporting("administrator", "G-merin0", "merinodomain");
            ReportViewerRV.ServerReport.ReportServerCredentials = icredenteials;
            ReportViewerRV.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote;
            ReportViewerRV.ServerReport.ReportServerUrl = new Uri("http://gmserver01:81/ReportServer");

            //if (Request.QueryString["p"] == null) { Path = "/MERSA/Visor de Reporte/Principal"; }
            if (Request.QueryString["p"] == null) { Imagen1.Visible = true; Panel1.Visible = false; Panel2.Visible = false; }
            else { Imagen1.Visible = false; Panel1.Visible = true; Panel2.Visible = true; Path = "/Visor de Reporte/GRUPO MERINO/" + Request.QueryString["p"].ToString(); }
            ReportViewerRV.ServerReport.ReportPath = Path;
            ReportViewerRV.PromptAreaCollapsed = true;
            Path = "";
        }
    }
    protected void Cerrar_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        //se borra la cookie de autenticacion
        FormsAuthentication.SignOut();

        //se redirecciona al usuario a la pagina de login
        //Response.Redirect(Request.UrlReferrer.ToString());
        Response.Redirect("Login.aspx",true);
      
    }
    public class Reporting : Microsoft.Reporting.WebForms.IReportServerCredentials
    {
        string _usuario, _password, _dominio;
        public Reporting(string userName, string password, string domain)
        {
            _usuario = userName;
            _password = password;
            _dominio = domain;
        }

        public System.Security.Principal.WindowsIdentity ImpersonationUser
        {
            get
            {
                return null;
            }
        }

        public System.Net.ICredentials NetworkCredentials
        {
            get
            {
                return new System.Net.NetworkCredential(_usuario, _password, _dominio);
            }
        }

        public bool GetFormsCredentials(out System.Net.Cookie authCoki, out string userName, out string password, out string authority)
        {
            userName = _usuario;
            password = _password;
            authority = _dominio;
            authCoki = new System.Net.Cookie(".ASPXAUTH", ".ASPXAUTH", "/", "Domain");
            return true;
        }

    }
    protected void bt_Click(object sender, EventArgs e)
    {
        int zoomRV = 80;
        try
        {
        zoomRV = int.Parse(Request.Form.Get("slider_input")); 
        ReportViewerRV.ZoomPercent = zoomRV;
        }
        catch (Exception)
        {
        }
       
    }
    public void SmartTv(){
        string querystring;
        querystring = Request.QueryString["p"];
        if (querystring == null && LbUsuario.Text == "A-SmartTV") { Response.AppendHeader("Refresh", "0; URL= http://gmserver01/mersan/default.aspx?p=Operativo/A/Romana"); }

        if (querystring == "Operativo/A/Romana" && LbUsuario.Text == "A-SmartTV") { Response.AppendHeader("Refresh", "120; URL=http://gmserver01/mersan/default.aspx?p=Operativo/Despacho/Despacho%20Dia"); }

        if (querystring == "Operativo/Despacho/Despacho Dia" && LbUsuario.Text == "A-SmartTV") { Response.AppendHeader("Refresh", "120; URL=http://gmserver01/mersan/default.aspx?p=Operativo/Recepcion/Recepcion%20Dia"); }

        if (querystring == "Operativo/Recepcion/Recepcion Dia" && LbUsuario.Text == "A-SmartTV") { Response.AppendHeader("Refresh", "120; URL= http://gmserver01/mersan/default.aspx"); querystring = null; }


        if (querystring == null && LbUsuario.Text.ToString() == "B-SmartTV") { Response.AppendHeader("Refresh", "0; URL= http://gmserver01/mersan/default.aspx?p=Operativo/Produccion/Proyeccion%20Mes"); }

        if (querystring == "Operativo/Produccion/Proyeccion Mes" && LbUsuario.Text.ToString() == "B-SmartTV") { Response.AppendHeader("Refresh", "120; URL=http://gmserver01/mersan/default.aspx?p=Operativo/Produccion/Produccion%20Dia"); }

        if (querystring == "Operativo/Produccion/Produccion Dia" && LbUsuario.Text.ToString() == "B-SmartTV") { Response.AppendHeader("Refresh", "120; URL=http://gmserver01/mersan/default.aspx?p=Operativo/Produccion/Produccion%20Turno%20Dia"); }

        if (querystring == "Operativo/Produccion/Produccion Turno Dia" && LbUsuario.Text.ToString() == "B-SmartTV") { Response.AppendHeader("Refresh", "120; URL= http://gmserver01/mersan/default.aspx"); querystring = null; }
    
    
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {

        var urlActual = Page.Request.Url.AbsoluteUri;
        string urlU = urlActual.ToString();

        if (LbUsuario.Text.ToString() == "B-SmartTV" && urlU == "http://gmserver01/mersan/default.aspx")
        { Response.Redirect("http://gmserver01/mersan/default.aspx?p=Operativo/Produccion/Produccion%20Dia"); }

        if (LbUsuario.Text.ToString() == "B-SmartTV" && urlU == "http://gmserver01/mersan/default.aspx?p=Operativo%2fProduccion%2fProduccion+Dia")
        { Response.Redirect("http://gmserver01/mersan/default.aspx?p=Operativo/Produccion/Proyeccion%20Mes"); }

        if (LbUsuario.Text.ToString() == "B-SmartTV" && urlU == "http://gmserver01/mersan/default.aspx?p=Operativo%2fProduccion%2fProyeccion+Mes")
        { Response.Redirect("http://gmserver01/mersan/default.aspx?p=Operativo/Produccion/Produccion%20Turno%20Dia"); }

        if (LbUsuario.Text.ToString() == "B-SmartTV" && urlU == "http://gmserver01/mersan/default.aspx?p=Operativo%2fProduccion%2fProduccion+Turno+Dia")
        { Response.Redirect("http://gmserver01/mersan/default.aspx"); }


        if (LbUsuario.Text.ToString() == "A-SmartTV" && urlU == "http://gmserver01/mersan/default.aspx")
        { Response.Redirect("http://gmserver01/mersan/default.aspx?p=Operativo%2fA%2fRomana"); }

        if (LbUsuario.Text.ToString() == "A-SmartTV" && urlU == "http://gmserver01/mersan/default.aspx?p=Operativo%2fA%2fRomana")
        { Response.Redirect("http://gmserver01/mersan/default.aspx?p=Operativo%2fDespacho%2fDespacho+Dia"); }

        if (LbUsuario.Text.ToString() == "A-SmartTV" && urlU == "http://gmserver01/mersan/default.aspx?p=Operativo%2fDespacho%2fDespacho+Dia")
        { Response.Redirect("http://gmserver01/mersan/default.aspx?p=Operativo%2fRecepcion%2fRecepcion+Dia"); }

        if (LbUsuario.Text.ToString() == "A-SmartTV" && urlU == "http://gmserver01/mersan/default.aspx?p=Operativo%2fRecepcion%2fRecepcion+Dia")
        { Response.Redirect("http://gmserver01/mersan/default.aspx"); }
    }
}