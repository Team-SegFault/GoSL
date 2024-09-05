import React, { useState, useEffect } from "react";
import { Input } from "@/components/ui/input";
import { DataTable } from "@/components/common/datatable";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import columns from "./columns";
import { ApplicationStatus } from "@/lib/status.enum";
import visaApplicationsData from "./data.json";

const Dashboard = () => {
  const [applications, setApplications] = useState(visaApplicationsData);
  const [filterStatus, setFilterStatus] = useState("");
  const [searchTerm, setSearchTerm] = useState("");
  const [sortOption, setSortOption] = useState("date");

  // Filter by status
  useEffect(() => {
    let filteredApplications = visaApplicationsData;

    if (filterStatus) {
      filteredApplications = filteredApplications.filter(
        (app) => app.status === filterStatus,
      );
    }

    if (searchTerm) {
      filteredApplications = filteredApplications.filter((app) =>
        app.name.toLowerCase().includes(searchTerm.toLowerCase()),
      );
    }

    // Sort applications by selected option
    if (sortOption === "date") {
      filteredApplications.sort((a, b) => new Date(b.date) - new Date(a.date));
    } else if (sortOption === "name") {
      filteredApplications.sort((a, b) => a.name.localeCompare(b.name));
    }

    setApplications(filteredApplications);
  }, [filterStatus, searchTerm, sortOption]);

  return (
    <div>
      <h1 className="text-xl font-bold">Visa Application Dashboard</h1>

      {/* Filters */}
      <div className="my-4 flex justify-between gap-2">
        <Input
          placeholder="Search by applicant name"
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
        />

        {/* Filter by Status */}
        <Select onValueChange={(value) => setFilterStatus(value)}>
          <SelectTrigger className="w-[180px]">
            <SelectValue placeholder="Filter by Status" />
          </SelectTrigger>
          <SelectContent>
            {Object.values(ApplicationStatus).map((status) => (
              <SelectItem key={status} value={status}>
                {status}
              </SelectItem>
            ))}
          </SelectContent>
        </Select>

        {/* Sort by Option */}
        <Select onValueChange={(value) => setSortOption(value)}>
          <SelectTrigger className="w-[180px]">
            <SelectValue placeholder="Sort by" />
          </SelectTrigger>
          <SelectContent>
            <SelectItem value="date">Submission Date</SelectItem>
            <SelectItem value="name">Applicant Name</SelectItem>
          </SelectContent>
        </Select>
      </div>

      {/* Data Table */}
      <DataTable columns={columns} data={applications} />
    </div>
  );
};

export default Dashboard;
