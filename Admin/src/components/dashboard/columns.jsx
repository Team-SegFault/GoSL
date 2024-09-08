import { StatusBadge } from "./status-badge";
import { Button } from "@/components/ui/button";
import { ArrowUpDown } from "lucide-react";
import { ApplicationStatus } from "@/lib/status.enum";

const columns = [
  {
    header: "ID",
    accessorKey: "id",
  },
  {
    header: "Name",
    accessorKey: "name",
  },
  {
    header: ({ column }) => {
      return (
        <Button
          variant="ghost"
          onClick={() => column.toggleSorting(column.getIsSorted() === "asc")}
        >
          Submission Date
          <ArrowUpDown className="ml-2 h-4 w-4" />
        </Button>
      );
    },
    accessorKey: "date",
  },
  {
    header: "Country",
    accessorKey: "country",
  },
  {
    header: "Status",
    accessorKey: "status",
    cell: ({ row }) => {
      const status = row.getValue("status");
      return <StatusBadge status={status} />;
    },
  },
  {
    header: "Action",
    cell: ({ row }) => {
      const status = row.getValue("status");
      if (status != ApplicationStatus.Pending) return <></>;
      return (
        <Button
          variant="outline"
          size="sm"
          onClick={(e) => {
            e.stopPropagation();
          }}
        >
          Review
        </Button>
      );
    },
  },
];

export default columns;
