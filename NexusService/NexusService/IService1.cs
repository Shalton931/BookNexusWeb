using NexusService.classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace NexusService
{

    [ServiceContract]
    public interface IService1
    {

        // TODO: Add your service operations here
        [OperationContract]
        bool Register(String firstName, String lastName, String email, String password);

        [OperationContract]
        bool logIn(String email, String password);

        [OperationContract]
        void InsertProducts();

    }

}
