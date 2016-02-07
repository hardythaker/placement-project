using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace PlacementCell
{
    public class Register
    {
        public static void registerMember(string user, string pass)//chabge it to bool if it is in use
        {
            //try
            //{
            //    string hashedVal = HashGenerator.getHash(user, pass); //calling the gethash method in hashgenerator class to get a ency pass+username as password
            //                                                          //MySqlConnection dbcon = ConnectionManager.GetDatabaseConnection();
            //                                                          //using (dbcon)
            //                                                          //{

            //    //}
            //    if (DataAccessLayer.isMemRegSuccessful(user, hashedVal) == false)
            //    {
            //        return false;
            //    }
            //    return true;
            //}
            //catch (Exception)
            //{
            //    return false;
            //}
        }
    }
}