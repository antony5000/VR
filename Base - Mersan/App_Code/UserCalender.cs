using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de UserCalender
/// </summary>
public class UserCalender
{
    BioStarEntities modeloBio = new BioStarEntities();
    //BioEntities modeloBio = new BioEntities();
    public UserCalender()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public void PosicionCalendario(string id, DateTime inicio, DateTime parametro)
    {
        int vuelta = 1; // Cuantas Vueltas se van a realizar
        bool siete = true;
        int Posicion = 0; // Posicion se la semana 
        int semana = 5; // Semana comienza los jueves
        int vueltaf = 1; // Periodos del Ciclo
        int idint = Convert.ToInt32(id);
        int totalDia = 0;
        try
        {
        Calendars calendario = modeloBio.Calendars.Where(x => x.nShiftIdn == idint).FirstOrDefault();
        if (calendario != null)
        {
            string ciclo = calendario.nCycleType.ToString();
            string periodo = calendario.nCyclePeriod.ToString();

            if (ciclo == "0") { vuelta = 1; }
            else { vuelta = Convert.ToInt32(periodo) / 7; }

            TimeSpan ts = parametro - inicio;
            totalDia = ts.Days;

            while (totalDia > 0)
            {
                totalDia--;
                if (semana == 7)
                {
                    semana = 0;
                    if (vueltaf == vuelta) 
                    { siete = true; vueltaf = 1; } 
                    else 
                    { siete = false; vueltaf = vueltaf + 1; }
                }
                semana = semana + 1;
            }

            // 1 = Lunes  // 2 = Martes // 3 = Miercoles // 4 = Jueves // 5 = Viernes   // 6 = Sabado // 7 = Domingo
            if (siete == true) 
            {
                if (ciclo == "0") { Posicion = (int)parametro.DayOfWeek - 1; }
                else { 
                int SemAct = (int)parametro.DayOfWeek;
                if (SemAct >= 4) { Posicion = (int)parametro.DayOfWeek - 3; }
                else { Posicion = (int)parametro.DayOfWeek + 4; }
                }
            } 
            //{ Posicion = (int)parametro.DayOfWeek -1 ; } 
            else { Posicion = ((vueltaf - 1) * 7) + (semana - 4); }

            // buscar el cual es el turno de el dia
            List<Calendar> calendarios = modeloBio.Calendar.Where(x => x.nShiftIdn == idint).OrderBy(x => x.nShiftIdn).ThenBy(x => x.nShiftDailyIdn).ToList();
                                                         //.Where(x => x.nShiftIdn == idint).ToList();

            // GUARDAR REGISTRO
            var CalendarioR = new VR_calender();
            CalendarioR.nShiftIdn = calendarios[Posicion].nShiftIdn;
            CalendarioR.sName = calendarios[Posicion].Calendario;
            CalendarioR.nStartTime = Convert.ToInt32(calendarios[Posicion].Minimo);
            CalendarioR.nEndTime = Convert.ToInt32(calendarios[Posicion].Maximo);
            CalendarioR.nCycleType = calendarios[Posicion].nCycleType;
            CalendarioR.nCyclePeriod = calendarios[Posicion].nCyclePeriod;
            CalendarioR.idHorario = calendarios[Posicion].nDailyScheduleIdn;
            CalendarioR.nameHorario = calendarios[Posicion].Expr1;
            CalendarioR.fecha = parametro;
            // Add registro
            modeloBio.VR_calender.Add(CalendarioR);
            modeloBio.SaveChanges();
        }
        }
        catch (Exception)
        {    
            throw;
        }
       

        
    }

    public void CicloCalendario()
    {
        List<Calendars> lista = modeloBio.Calendars.ToList();

        foreach (Calendars item in lista)
        {
            DateTime dateI = new DateTime(1970, 1, 1, 0, 0, 0);
            ///  año , mes , dia
            DateTime dateF = new DateTime(2015, 7, 30, 0, 0, 0);
            PosicionCalendario(item.nShiftIdn.ToString(), dateI, DateTime.Now);
        }
    }


    public void EliminarTabla() {
        
        IEnumerable<VR_calender> listae = modeloBio.VR_calender.AsEnumerable();

        modeloBio.VR_calender.RemoveRange(listae);
        modeloBio.SaveChanges();

        IEnumerable<VR_calender> lista = modeloBio.VR_calender.AsEnumerable();
        
    
    }
}
