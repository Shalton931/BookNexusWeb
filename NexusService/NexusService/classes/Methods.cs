using System;
using System.Data;
using System.Data.SqlClient;


/*This namespace contains all functions related to Sql queries
 * as helper methods used in Service1.svc.cs
 */
namespace NexusService.classes
{
    public class Methods
    {
        //Class Attributes
        private SqlConnection sqlCon;
        private SqlCommand command;
        private DataTable dataT;
        private SqlDataAdapter dataAdapter;
        private String connectionString;

        public Methods()
        {
            connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=BookNexusDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            sqlCon = new SqlConnection(connectionString);
            command = new SqlCommand();
            command.Connection = sqlCon;
        }

        public String getConStr() { return this.connectionString; }
        public SqlCommand getCommand() { return this.command; }
        
        /*changes to make
         * Changing function parameter from string to type SqlCommand,
         * for saftey(Avoid sql injection)
         * Changes after 1st Submission/deadline
         */
        public DataTable RetrieveData(String query, SqlParameter[] param)
        {
      
            dataT = new DataTable();
            try 
            {
                using (sqlCon = new SqlConnection(connectionString))
                using (command = new SqlCommand(query, sqlCon))
                {
                    if (param != null && param.Length > 0)
                        command.Parameters.AddRange(param);

                    using (dataAdapter = new SqlDataAdapter(command))
                    {
                        dataAdapter.Fill(dataT);
                    }
                }

           }catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return dataT;
        }

    }

}
