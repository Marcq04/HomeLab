#!/bin/bash

GATEWAY="192.168.70.1"
PUBLIC_DNS="1.1.1.1"

echo "=== Home Lab Network Diagnostics ==="

# Check local DMZ gateway
if ping -c 1 "$GATEWAY" &> /dev/null; then
    echo "[OK] DMZ Gateway ($GATEWAY) is reachable."
else
    echo "[FAIL] DMZ Gateway ($GATEWAY) is unreachable!"
fi

# Check outbound internet reachability
if ping -c 1 "$PUBLIC_DNS" &> /dev/null; then
    echo "[OK] Internet Connectivity (1.1.1.1) is online."
else
    echo "[FAIL] No outbound Internet connectivity."
fi

# Check DNS Resolution
if nslookup google.com &> /dev/null; then
    echo "[OK] DNS Resolution is working."
else
    echo "[FAIL] DNS Resolution failed!"
fi
