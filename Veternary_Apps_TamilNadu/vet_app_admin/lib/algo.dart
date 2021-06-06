//if doctor.workweek%exp(2,weekday)==1 weekdays stars from monday
//if doctor.holiday==2
//0- not holiday, -1- requested holiday, n->n. of holiday alocated
//on press allocate if n>0 n-- and holidaycount++
//locality with max(lsum1)
//lsum1-severity of whole locality
//allocate(locality,lsum1,lsum2)
//admin.noMinutes-- number of minutes working per day
/*void allocate(locality,lsum1,lsum2) {
  if(lsum2<noMinutes){
    //allocate all cases
    lsum1=0;
    lsum2=0;
  }
  else {
    int dsum2 = 0;
    for(;sum2<noMinutes;){
      get case with max severity
      lsum1-=case.severity;
      lsum2-=case.timescore;
      dsum2+=case.timescore;
    }
  }
}*/
