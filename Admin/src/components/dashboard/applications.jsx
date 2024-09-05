import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { DataTable } from "@/components/common/datatable";
import columns from "./columns";
import visaApplicationsData from "./data.json";
import { DETAILS_ROUTE } from "@/routes";

const Dashboard = () => {
  const [applications, setApplications] = useState(visaApplicationsData);
  const navigate = useNavigate();
  return (
    <div>
      <h1 className="text-xl font-bold">Visa Application Dashboard</h1>
      {/* Data Table */}
      <DataTable
        columns={columns}
        data={applications}
        onRowClick={(row) => {
          // navigate to application details page
          navigate(DETAILS_ROUTE, {
            state: { applicationId: row.getValue("name") },
          });
        }}
      />
    </div>
  );
};

export default Dashboard;
