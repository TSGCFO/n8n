# Overview

This is a Replit template for n8n (n8n.io), an open-source workflow automation platform. The template provides a pre-configured environment for creating and running n8n workflows with persistent data storage. It includes configuration management through files and uses a SQLite database by default for storing workflow data.

# User Preferences

Preferred communication style: Simple, everyday language.

# System Architecture

## Core Framework

- **Platform**: n8n workflow automation engine (version 1.109.2)
- **Runtime**: Node.js environment with npm package management
- **Startup**: Bash script (`main.sh`) handles application initialization

## Configuration Management

- **Method**: File-based configuration system located in `n8n-config/` directory
- **Rationale**: Allows persistent configuration that survives repl restarts
- **Reference**: All configuration options follow n8n's official documentation standards

## Data Persistence

- **Default Database**: SQLite file stored in `n8n/` folder
- **Benefits**: Lightweight, file-based storage that persists across repl restarts
- **Flexibility**: Database configuration can be modified through config files

## Extensibility

- **Node Modules**: Support for custom n8n nodes through `n8n-config/nodes/` directory
- **Package Management**: Dedicated package.json for managing additional node dependencies
- **Architecture**: Modular design allows extending n8n functionality without affecting core system

# External Dependencies

## Core Dependencies

- **n8n**: Main workflow automation platform (v1.109.2)
- **curl**: HTTP client library for external API interactions

## Development Tools

- **npm**: Package management and dependency resolution
- **bash**: Shell scripting for application startup and configuration

## Documentation Reference

- **n8n Configuration Docs**: https://docs.n8n.io/hosting/configuration/#configuration-by-file
- **Official n8n Site**: https://n8n.io

## Template Attribution

- **Creator**: @HackermonDev on Replit
- **Origin**: Created for a Replit bounty by @antoine
