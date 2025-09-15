import { useState } from "react";
import { RecommendedWorkers } from "./components/RecommendedWorkers";
import { BottomNavigation } from "./components/BottomNavigation";
import { SearchBar } from "./components/SearchBar";
import { FiltersSidebar } from "./components/FiltersSidebar";
import { ViewToggle } from "./components/ViewToggle";
import { SearchResults } from "./components/SearchResults";

export default function App() {
  const [isFiltersOpen, setIsFiltersOpen] = useState(false);
  const [view, setView] = useState<"grid" | "list">("grid");

  return (
    <div className="min-h-screen bg-background pb-20">
      {/* Search Bar */}
      <SearchBar onFiltersClick={() => setIsFiltersOpen(true)} />
      
      {/* Filters Sidebar */}
      <FiltersSidebar 
        isOpen={isFiltersOpen} 
        onClose={() => setIsFiltersOpen(false)} 
      />

      {/* Main Content */}
      <div className="max-w-7xl mx-auto p-6 space-y-8">
        {/* Recommended Workers Section */}
        <RecommendedWorkers />
        
        {/* View Toggle */}
        <div className="flex justify-end">
          <ViewToggle view={view} onViewChange={setView} />
        </div>

        {/* Search Results */}
        <SearchResults view={view} />
      </div>

      {/* Bottom Navigation */}
      <BottomNavigation />
    </div>
  );
}
