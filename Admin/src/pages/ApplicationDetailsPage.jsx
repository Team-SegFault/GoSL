import VisaApplication from "@/components/visa-application";
import { useLocation } from "react-router-dom";

const ApplicationDetailsPage = () => {
  const location = useLocation();
  const { applicationId } = location.state || {};

  return (
    <div>
      <h1>Application Details</h1>
      <p>Application ID: {applicationId}</p>
      <VisaApplication />
    </div>
  );
};

export default ApplicationDetailsPage;
