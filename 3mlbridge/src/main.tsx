import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App.tsx";
import { ThemeProvider } from "@/components/theme-provider.tsx";
import "./index.css";
import { StarknetProvider } from "./components/StarknetProvider.tsx";

ReactDOM.createRoot(document.getElementById("root")!).render(
  <React.StrictMode>
    <ThemeProvider>
      <StarknetProvider>
      <App />
      </StarknetProvider>
    </ThemeProvider>
  </React.StrictMode>
);
