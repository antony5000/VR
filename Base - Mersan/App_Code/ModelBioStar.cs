﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class Calendar
{
    public int nShiftIdn { get; set; }
    public string Calendario { get; set; }
    public short nCycleType { get; set; }
    public int nCyclePeriod { get; set; }
    public int nDailyScheduleIdn { get; set; }
    public string Expr1 { get; set; }
    public Nullable<int> nDateStartTime { get; set; }
    public int nShiftDailyIdn { get; set; }
    public Nullable<int> Expr2 { get; set; }
    public Nullable<int> Minimo { get; set; }
    public Nullable<int> Maximo { get; set; }
}

public partial class Calendars
{
    public int nShiftIdn { get; set; }
    public string sName { get; set; }
    public short nCycleType { get; set; }
    public int nCyclePeriod { get; set; }
}

public partial class User
{
    public int nUserIdn { get; set; }
    public string sUserID { get; set; }
    public string sUserName { get; set; }
    public int nDepartmentIdn { get; set; }
    public string sName { get; set; }
    public int nType { get; set; }
    public int nShiftIdn { get; set; }
    public string Calendario { get; set; }
    public short nCycleType { get; set; }
    public int nCyclePeriod { get; set; }
    public string nFecha { get; set; }
}

public partial class VR_calender
{
    public int nShiftIdn { get; set; }
    public string sName { get; set; }
    public int nStartTime { get; set; }
    public int nEndTime { get; set; }
    public short nCycleType { get; set; }
    public int nCyclePeriod { get; set; }
    public Nullable<int> idHorario { get; set; }
    public string nameHorario { get; set; }
    public System.DateTime fecha { get; set; }
}
