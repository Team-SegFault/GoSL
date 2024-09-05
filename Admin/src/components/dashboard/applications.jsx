import React, { useState } from "react";
import { DataTable } from "@/components/common/datatable";
import columns from "./columns";
import visaApplicationsData from "./data.json";

const Dashboard = () => {
  const [applications, setApplications] = useState(visaApplicationsData);

  return (
    <div>
      <h1 className="text-xl font-bold">Visa Application Dashboard</h1>
      {/* Data Table */}
      <DataTable
        columns={columns}
        data={applications}
        onRowClick={(row) => {
          console.log("Row clicked", row);
        }}
      />
    </div>
  );
};

export default Dashboard;
