using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    string Path = "";
    string RutaUrl = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ConfigurarRS();
            if (Request.QueryString["p"] == null)
            { }
            else
            {   Path = RutaUrl + Request.QueryString["p"].ToString(); }
            ReportViewerRV.ServerReport.ReportPath = Path;
            ReportViewerRV.PromptAreaCollapsed = true;
            Path = "";
            //if (Request.QueryString["p"] == null) { Path = "/MERSA/Visor de Reporte/Principal"; }
            //if (Request.QueryString["p"] == null) { /*Imagen1.Visible = true; Panel1.Visible = false; Panel2.Visible = false;*/ }
            // else { /*Imagen1.Visible = false; Panel1.Visible = true; Panel2.Visible = true;*/ Path = "/Visor de Reporte/GRUPO MERINO/" + Request.QueryString["p"].ToString(); }
        }
    }

    #region Reporting (CLASE PARA INVOCAR REPORTES DE REPORNTING SEVICES)
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
    #endregion

    #region  Reporting (CONFIGURACION DE REPORNTIG SERVICES)
    public void ConfigurarRS(){  
        Microsoft.Reporting.WebForms.IReportServerCredentials icredenteials = new Reporting("administrator", "G-merin0", "merinodomain");
        ReportViewerRV.ServerReport.ReportServerCredentials = icredenteials;
        ReportViewerRV.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote;
        ReportViewerRV.ServerReport.ReportServerUrl = new Uri("http://gmserver01:81/ReportServer");
        RutaUrl= "/Visor de Reporte/JL/";
    }
    #endregion
}