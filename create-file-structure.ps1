# Define the base directory
$baseDir = "ansible-openvpn"

# Define all paths as a tree
$paths = @(
    "$baseDir/playbooks/main.yml",
    "$baseDir/roles/openvpn_server/tasks/main.yml",
    "$baseDir/roles/openvpn_server/templates/server.conf.j2",
    "$baseDir/roles/openvpn_server/handlers/main.yml",
    "$baseDir/roles/openvpn_server/vars/main.yml",
    "$baseDir/roles/openvpn_client/tasks/main.yml",
    "$baseDir/roles/openvpn_client/templates/client.ovpn.j2",
    "$baseDir/roles/openvpn_client/vars/main.yml",
    "$baseDir/README.md"
)

# Create directories and files
foreach ($path in $paths) {
    $dir = [System.IO.Path]::GetDirectoryName($path)
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force
    }
    if (-not (Test-Path $path)) {
        New-Item -ItemType File -Path $path -Force
    }
}

Write-Host "File structure created successfully."
