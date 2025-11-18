/**
 * API GATEWAY
 *
 * Punto di ingresso unico per tutti i microservizi
 * Gestisce il routing delle richieste verso i servizi appropriati
 */

const express = require("express");
const cors = require("cors");
const { createProxyMiddleware } = require("http-proxy-middleware");
const path = require("path");
require("dotenv").config();

const config = require(path.join(__dirname, "../../shared/config"));

const app = express();
const PORT = config.ports.gateway;

// Middleware
app.use(cors(config.cors));
// NON parsare il body nel gateway - lascia che lo facciano i microservizi
// app.use(express.json());
// app.use(express.urlencoded({ extended: true }));

// Logging middleware
app.use((req, res, next) => {
  console.log(`[${new Date().toISOString()}] ${req.method} ${req.url}`);
  next();
});

// Health check del gateway
app.get("/health", (req, res) => {
  res.json({
    status: "UP",
    service: "API Gateway",
    timestamp: new Date().toISOString(),
  });
});

// Info sui servizi disponibili
app.get("/services", (req, res) => {
  res.json({
    gateway: `http://localhost:${config.ports.gateway}`,
    services: {
      users: {
        url: config.services.user,
        port: config.ports.user,
        endpoints: "/api/users/*",
      },
      albums: {
        url: config.services.album,
        port: config.ports.album,
        endpoints: "/api/albums/*",
      },
      images: {
        url: config.services.image,
        port: config.ports.image,
        endpoints: "/api/images/*",
      },
    },
  });
});

// ============================================
// PROXY CONFIGURATION
// Routing verso i microservizi
// ============================================

// User Service
app.use(
  "/api/users",
  createProxyMiddleware({
    target: config.services.user,
    changeOrigin: true,
    timeout: 30000, // 30 secondi
    proxyTimeout: 30000, // 30 secondi
    onError: (err, req, res) => {
      console.error("❌ User Service Error:", err.message);
      if (!res.headersSent) {
        res.status(503).json({
          success: false,
          error: "User Service non disponibile",
        });
      }
    },
    onProxyReq: (proxyReq, req, res) => {
      console.log(`[PROXY] → User Service: ${req.method} ${req.url}`);
    },
    onProxyRes: (proxyRes, req, res) => {
      console.log(`[PROXY] ← User Service: ${proxyRes.statusCode}`);
    },
  })
);

// Album Service
app.use(
  "/api/albums",
  createProxyMiddleware({
    target: config.services.album,
    changeOrigin: true,
    timeout: 30000,
    proxyTimeout: 30000,
    onError: (err, req, res) => {
      console.error("❌ Album Service Error:", err.message);
      if (!res.headersSent) {
        res.status(503).json({
          success: false,
          error: "Album Service non disponibile",
        });
      }
    },
    onProxyReq: (proxyReq, req, res) => {
      console.log(`[PROXY] → Album Service: ${req.method} ${req.url}`);
    },
    onProxyRes: (proxyRes, req, res) => {
      console.log(`[PROXY] ← Album Service: ${proxyRes.statusCode}`);
    },
  })
);

// Image Service
app.use(
  "/api/images",
  createProxyMiddleware({
    target: config.services.image,
    changeOrigin: true,
    timeout: 30000,
    proxyTimeout: 30000,
    onError: (err, req, res) => {
      console.error("❌ Image Service Error:", err.message);
      if (!res.headersSent) {
        res.status(503).json({
          success: false,
          error: "Image Service non disponibile",
        });
      }
    },
    onProxyReq: (proxyReq, req, res) => {
      console.log(`[PROXY] → Image Service: ${req.method} ${req.url}`);
    },
    onProxyRes: (proxyRes, req, res) => {
      console.log(`[PROXY] ← Image Service: ${proxyRes.statusCode}`);
    },
  })
);

// ============================================
// ERROR HANDLING
// ============================================

// 404 - Route non trovata
app.use((req, res) => {
  res.status(404).json({
    success: false,
    error: "Endpoint non trovato",
    path: req.url,
    method: req.method,
  });
});

// Error handler globale
app.use((err, req, res, next) => {
  console.error("❌ Gateway Error:", err);
  res.status(err.status || 500).json({
    success: false,
    error: err.message || "Errore interno del gateway",
  });
});

// ============================================
// START SERVER
// ============================================

app.listen(PORT, () => {
  console.log("=".repeat(50));
  console.log("🚀 API GATEWAY STARTED");
  console.log("=".repeat(50));
  console.log(`📍 Gateway URL: http://localhost:${PORT}`);
  console.log(`📋 Services info: http://localhost:${PORT}/services`);
  console.log(`❤️  Health check: http://localhost:${PORT}/health`);
  console.log("=".repeat(50));
  console.log("📡 Routing configuration:");
  console.log(`   /api/users/*     → ${config.services.user}`);
  console.log(`   /api/albums/*    → ${config.services.album}`);
  console.log(`   /api/images/*    → ${config.services.image}`);
  console.log("=".repeat(50));
});

module.exports = app;
