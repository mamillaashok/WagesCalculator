package main

import "github.com/aws/aws-lambda-go/lambda"

type EmployeWorkingHours struct {
	Name       string  `json:"name"`
	Hours      float32 `json:"hours,string,omitempty"`
	HourlyRate float32 `json:"hourlyrate,string,omitempty"`
}
type EmployePay struct {
	Name string  `json:"name"`
	Pay  float32 `json:pay,string,omitempty`
}

func GetEmployePayment(ewh EmployeWorkingHours) (EmployePay, error) {
	return EmployePay{
		Name: ewh.Name,
		Pay:  ewh.HourlyRate * ewh.Hours,
	}, nil
}
func main() {
	lambda.Start(GetEmployePayment)
}
