import unittest
from DAO import CustomerService, VehicleService, AuthenticationService
from Entity import Customer, Vehicle
class TestCustomerAuthentication(unittest.TestCase):

    def setUp(self):
        Cust_service = CustomerService()
        self.custom_serv = CustomerService()
        self.authentication_service = AuthenticationService(Cust_service) 

    def test_update_customer_info(self):
        customer = Customer('Reeha','Mary','rme@example.com',2744456890,'Gaajuwaka, Vizag','ReehaM','reeh34','2024-07-06');
        # customer = Customer(1, 'Akhil', 'Sai', 'akhilsai@example.com', '1234567890', ' Ampolu Road', 'akhilsai', 'password123')
        customer.first_name = 'Raha'
        self.assertEqual(customer.first_name, 'Raha')


    def test_add_new_vehicle(self):
        vehicle = Vehicle('Toyota', 'Camry', 2022, 'Silver', 'ABC123', True, 50.00)
        self.assertIsNotNone(vehicle)



    def test_authentication_with_invalid_credentials(self):
        username = "invalid_username"
        password = "invalid_password"

        result = self.authentication_service.authenticate_customer(username,password)

        self.assertFalse(result, "Authentication should fail with invalid credentials")
    

class TestVehcile(unittest.TestCase):

    def setUp(self):
        self.vehicle_service = VehicleService()

    def test_update_vehicle_details(self):
        vehicle = Vehicle('Toyota', 'Camry', 2022, 'Silver', 'ABC123', True, 50.00)
        vehicle.model = 'Corolla'
        self.assertEqual(vehicle.model, 'Corolla')


        
    def test_get_all_vehicles(self):
       
        vehicles = [Vehicle('Toyota', 'Camry', 2022, 'Silver', 'ABC123', True, 50.00),
                    Vehicle('Honda', 'Civic', 2020, 'Black', 'DEF456', True, 40.00),
                    Vehicle('Ford', 'Focus', 2019, 'Red', 'GHI789', False, 30.00)]
        self.assertEqual(len(vehicles), 3)
    
    def test_get_available_vehicles(self):
        available_vehicles = self.vehicle_service.GetAvailableVehicle()
        self.assertEqual(len(available_vehicles),10)
    
    
    def test_add_new_vehicle(self):
        vehicle = Vehicle('Toyota', 'Camry', 2022, 'Silver', 'ABC123', True, 50.00)
        self.assertIsNotNone(vehicle)

    def test_update_vehicle_details(self):
        vehicle = Vehicle('Toyota', 'Camry', 2022, 'Silver', 'ABC123', True, 50.00)
        vehicle.model = 'Corolla'
        self.assertEqual(vehicle.model, 'Corolla')

 

    
    

if __name__ =="__main__":
    unittest.main()