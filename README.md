# Hinvento Init

This repository provides shell scripts to streamline the setup and management of resources on Google Cloud Platform (GCP). It includes scripts for initializing projects and cleaning up resources efficiently.

## Features

- **Automated Initialization**: Step-by-step scripts to initialize GCP resources.
- **Resource Cleanup**: A script to clean up unused or unnecessary resources to keep your GCP environment tidy.
- **Modular Configuration**: Shared variable files for consistent configuration across scripts.

## Scripts Overview

### 1. `gcpCommonVariables.sh`
This script defines common variables used across the initialization and cleanup scripts. Modify this file to configure project-specific settings such as project ID, region, or service configurations.

### 2. `gcpInitStep01.sh`
The first step of the GCP initialization process. This script typically:
- Sets up core GCP resources.
- Configures the project environment.
- Prepares any prerequisites for additional setups.

### 3. `gcpInitStep02.sh`
The second step of the GCP initialization process. This script builds on the initial setup and might:
- Deploy further services or resources.
- Enable additional APIs or configurations.

### 4. `gcpCleanup.sh`
This script is used to clean up resources created during initialization. It ensures no unnecessary resources are left behind, helping to avoid unexpected costs.

## Usage

### Setup
1.  Clone the repository:
    ```bash
    git clone <repository_url>
    cd hinvento-init
    ```
2.  Make the scripts executable:
    ```bash
    chmod +x *.sh
    ```

### Execution
1.  Run the first initialization step:
    ```bash
    ./gcpInitStep01.sh
    ```

2.  Complete the setup with the second step:
    ```bash
    ./gcpInitStep02.sh
    ```

3.  Cleanup resources when no longer needed:
    ```bash
    ./gcpCleanup.sh
    ```    

## Notes

*   Before running the scripts, ensure that the Google Cloud SDK is installed and authenticated.
*   Update gcpCommonVariables.sh to match your project settings before execution.

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests to enhance the functionality of these scripts.

## Disclaimer

Use these scripts at your own risk. Always review and test them in a non-production environment before deploying to production.