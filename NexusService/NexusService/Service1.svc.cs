using System;
using System.Data;
using System.Data.SqlClient;
using NexusService.classes;

namespace NexusService
{

    public class Service1 : IService1
    {

       private Methods methods = new Methods();

        /*NOTE: The User table has some attributes which are not requried during
         * Registration, hence they are not submitted as query in this function,
         * They are nullable filds in the database for the time being.
         */
        public bool Register(String firstName, String lastName, String email, String password)
        {
            //Parameterized Queries prevents SQL Injection
            String query = "insert into [User] (firstName,lastName,email,password)" + "Values(@firstName,@lastName,@email,@password)";
            try
            {
                using (SqlConnection sqlConnection = new SqlConnection(methods.getConStr()))
                using (SqlCommand command = new SqlCommand(query, sqlConnection))
                {
                    command.Parameters.AddWithValue("@firstName", firstName);
                    command.Parameters.AddWithValue("@lastName", lastName);
                    command.Parameters.AddWithValue("@email", email);
                    command.Parameters.AddWithValue("@password", password);
                    sqlConnection.Open();

                    int rowAffected = command.ExecuteNonQuery();
                    return rowAffected > 0;
                }
            }catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
                return false;
            }


        }

        public bool logIn(string email, string password)
        {
            //@ - is a sql parameter
            String query = "Select Count(*) From [User] Where email = @email and password = @password";

            SqlParameter[] p =
            {
                new SqlParameter("@email",email),
                new SqlParameter("@password",password)
            };

            DataTable dataTable = methods.RetrieveData(query, p);

            if(dataTable.Rows.Count > 0 && Convert.ToInt32(dataTable.Rows[0][0]) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /*To be Implemented
         */
        public void InsertProducts()
        {
            throw new NotImplementedException();
        }
    }
}
