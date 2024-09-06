import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
  CardFooter,
} from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Separator } from "@/components/ui/separator";
import { Button } from "@/components/ui/button";
import { CheckCircle, XCircle, AlertCircle } from "lucide-react";

import PropTypes from "prop-types";
DetailComponent.propTypes = {
  applicationData: PropTypes.object.isRequired,
};

export default function DetailComponent({ applicationData }) {
  // Placeholder data - switch this for backend data
  applicationData = applicationData ?? {
    id: 1,
    form_created: "2024-09-06T13:55:40.867700Z",
    name: "John Doe",
    gender: "Male",
    occupation: "Employed",
    civil_status: "Married",
    date_of_birth: "2000-01-01",
    passport_size_photo:
      "http://localhost:8000/media/images/default_h6l8pVr.jpg",
    passport_issue_country: "United Kingdom",
    passport_number: "12342CX2342K",
    passport_issue_date: "2022-01-01",
    passport_expiry_date: "2030-01-01",
    passport_bio_page:
      "http://localhost:8000/media/passport_bio/ray-so-export_hK4rZdR.png",
    phone: "+941134293423",
    address: "No 1, Help Me Avenue, New York, USA.",
    email: "hello@example.com",
    visa_duration: 1,
    visa_start_date: "2024-12-01",
    past_travel_history: "None",
    isApproved: false,
    isProccessing: false,
    isRejected: false,
    isPending: true,
  };

  const handleApprove = () => {
    // Implement approval logic here
    console.log("Application approved");
  };

  const handleDeny = () => {
    // Implement denial logic here
    console.log("Application denied");
  };

  const handleCancel = () => {
    // Implement cancellation logic here
    console.log("Application cancelled");
  };

  return (
    <>
      <h1 className="text-xl font-bold">Application Details</h1>
      <p className="text-m">Application ID: {applicationData.id}</p>
      <Card className="w-full max-w-4xl mx-auto">
        <CardHeader>
          <CardTitle>Passport Application Form</CardTitle>
        </CardHeader>
        <CardContent className="space-y-6">
          {/* Application Details */}
          <div className="space-y-4">
            <h3 className="text-lg font-semibold">Application Details</h3>
            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="id">Application ID</Label>
                <Input id="id" value={applicationData.id} readOnly />
              </div>
              <div className="space-y-2">
                <Label htmlFor="form_created">Form Created</Label>
                <Input
                  id="form_created"
                  value={new Date(
                    applicationData.form_created
                  ).toLocaleString()}
                  readOnly
                />
              </div>
            </div>
          </div>

          <Separator />

          {/* Personal Information */}
          <div className="space-y-4">
            <h3 className="text-lg font-semibold">Personal Information</h3>
            <div className="space-y-2">
              <Label htmlFor="name">Name</Label>
              <Input id="name" value={applicationData.name} readOnly />
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="email">Email</Label>
                <Input
                  id="email"
                  type="email"
                  value={applicationData.email}
                  readOnly
                />
              </div>
              <div className="space-y-2">
                <Label htmlFor="phone">Phone</Label>
                <Input id="phone" value={applicationData.phone} readOnly />
              </div>
            </div>
            <div className="space-y-2">
              <Label htmlFor="address">Address</Label>
              <Input id="address" value={applicationData.address} readOnly />
            </div>
          </div>

          <Separator />

          {/* Passport Information */}
          <div className="space-y-4">
            <h3 className="text-lg font-semibold">Passport Information</h3>
            <div className="grid grid-cols-3 gap-4">
              <div className="space-y-2">
                <Label htmlFor="passport_number">Passport Number</Label>
                <Input
                  id="passport_number"
                  value={applicationData.passport_number}
                  readOnly
                />
              </div>
              <div className="space-y-2">
                <Label htmlFor="passport_issue_date">Issue Date</Label>
                <Input
                  id="passport_issue_date"
                  type="date"
                  value={applicationData.passport_issue_date}
                  readOnly
                />
              </div>
              <div className="space-y-2">
                <Label htmlFor="passport_expiry_date">Expiry Date</Label>
                <Input
                  id="passport_expiry_date"
                  type="date"
                  value={applicationData.passport_expiry_date}
                  readOnly
                />
              </div>
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="passport_photo">Passport Photo</Label>
                <div
                  className="border rounded-md overflow-hidden"
                  style={{ width: "300px", height: "400px" }}
                >
                  <img
                    src={applicationData.passport_photo}
                    alt="Passport photo"
                    className="w-full h-full object-cover"
                  />
                </div>
              </div>
              <div className="space-y-2">
                <Label htmlFor="passport_bio_photo">
                  Passport Bio Page Photo
                </Label>
                <div
                  className="border rounded-md overflow-hidden"
                  style={{ width: "600px", height: "400px" }}
                >
                  <img
                    src={applicationData.passport_bio_photo}
                    alt="Passport bio page photo"
                    className="w-full h-full object-cover"
                  />
                </div>
              </div>
            </div>
          </div>

          <Separator />

          {/* Visa Information */}
          <div className="space-y-4">
            <h3 className="text-lg font-semibold">Visa Information</h3>
            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="visa_type_reference">Visa Type</Label>
                <Input
                  id="visa_type_reference"
                  value={applicationData.visa_type_reference}
                  readOnly
                />
              </div>
              <div className="space-y-2">
                <Label htmlFor="visa_start_date">Visa Start Date</Label>
                <Input
                  id="visa_start_date"
                  type="date"
                  value={applicationData.visa_start_date}
                  readOnly
                />
              </div>
            </div>
          </div>
        </CardContent>
        <CardFooter className="flex justify-end space-x-4">
          <Button variant="outline" onClick={handleCancel}>
            <AlertCircle className="mr-2 h-4 w-4" />
            Cancel
          </Button>
          <Button
            disabled={!applicationData.isPending}
            variant="destructive"
            onClick={handleDeny}
          >
            <XCircle className="mr-2 h-4 w-4" />
            Deny
          </Button>
          <Button
            disabled={!applicationData.isPending}
            variant="default"
            onClick={handleApprove}
          >
            <CheckCircle className="mr-2 h-4 w-4" />
            Approve
          </Button>
        </CardFooter>
      </Card>
    </>
  );
}
