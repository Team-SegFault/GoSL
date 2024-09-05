import { StatusBadge } from "./status-badge";
import { Button } from "@/components/ui/button";
import { ArrowUpDown } from "lucide-react";

const columns = [
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
      console.log("status", status);
      return <StatusBadge status={status} />;
    },
  },
];

export default columns;
