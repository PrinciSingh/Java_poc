package social;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTime
{
    public static String getCurrentDateTime()
    {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm a");
        String cdate = sdf.format(new Date());
        return cdate;
    }

    public static String getDateTime()
    {
        SimpleDateFormat sdf = new SimpleDateFormat("MMM ,dd yyyy hh:mm a");
        String dateTime = sdf.format(new Date());
        return dateTime;
    }
}
