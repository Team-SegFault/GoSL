import { Card, CardContent, CardHeader, CardTitle, CardFooter } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Separator } from "@/components/ui/separator"
import { Button } from "@/components/ui/button"
import { CheckCircle, XCircle, AlertCircle } from "lucide-react"

export default function DetailComponent() {
  // Placeholder data - in a real application, this would come from your backend
  const applicationData = {
    id: 1,
    form_created: "2023-06-15T10:30:00Z",
    name: "John Doe",
    email: "john.doe@example.com",
    phone: "+1 (555) 123-4567",
    address: "123 Main St, Anytown, AN 12345",
    passport_number: "AB1234567",
    passport_issue_date: "2020-01-01",
    passport_expiry_date: "2030-01-01",
    passport_photo: "/placeholder.svg?height=400&width=300",
    passport_bio_photo: "/placeholder.svg?height=400&width=600",
    visa_type_reference: "Tourist Visa",
    visa_start_date: "2023-07-01",
  }

  const handleApprove = () => {
    // Implement approval logic here
    console.log("Application approved")
  }

  const handleDeny = () => {
    // Implement denial logic here
    console.log("Application denied")
  }

  const handleCancel = () => {
    // Implement cancellation logic here
    console.log("Application cancelled")
  }

  return (
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
              <Input id="form_created" value={new Date(applicationData.form_created).toLocaleString()} readOnly />
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
              <Input id="email" type="email" value={applicationData.email} readOnly />
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
              <Input id="passport_number" value={applicationData.passport_number} readOnly />
            </div>
            <div className="space-y-2">
              <Label htmlFor="passport_issue_date">Issue Date</Label>
              <Input id="passport_issue_date" type="date" value={applicationData.passport_issue_date} readOnly />
            </div>
            <div className="space-y-2">
              <Label htmlFor="passport_expiry_date">Expiry Date</Label>
              <Input id="passport_expiry_date" type="date" value={applicationData.passport_expiry_date} readOnly />
            </div>
          </div>
          <div className="grid grid-cols-2 gap-4">
            <div className="space-y-2">
              <Label htmlFor="passport_photo">Passport Photo</Label>
              <div className="border rounded-md overflow-hidden" style={{ width: '300px', height: '400px' }}>
                <img
                  src={applicationData.passport_photo}
                  alt="Passport photo"
                  className="w-full h-full object-cover"
                />
              </div>
            </div>
            <div className="space-y-2">
              <Label htmlFor="passport_bio_photo">Passport Bio Page Photo</Label>
              <div className="border rounded-md overflow-hidden" style={{ width: '600px', height: '400px' }}>
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
              <Input id="visa_type_reference" value={applicationData.visa_type_reference} readOnly />
            </div>
            <div className="space-y-2">
              <Label htmlFor="visa_start_date">Visa Start Date</Label>
              <Input id="visa_start_date" type="date" value={applicationData.visa_start_date} readOnly />
            </div>
          </div>
        </div>
      </CardContent>
      <CardFooter className="flex justify-end space-x-4">
        <Button variant="outline" onClick={handleCancel}>
          <AlertCircle className="mr-2 h-4 w-4" />
          Cancel
        </Button>
        <Button variant="destructive" onClick={handleDeny}>
          <XCircle className="mr-2 h-4 w-4" />
          Deny
        </Button>
        <Button variant="default" onClick={handleApprove}>
          <CheckCircle className="mr-2 h-4 w-4" />
          Approve
        </Button>
      </CardFooter>
    </Card>
  )
}