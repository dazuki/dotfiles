#!/bin/bash
vopono -v exec -i enp5s0 --provider protonvpn --protocol openvpn --port-forwarding --server sweden $1
