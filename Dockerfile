FROM odoo:19.0

USER root

# Install system dependencies needed for compiling python packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip \
    python3-dev \
    build-essential \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages required by Spanish OCA modules
RUN pip3 install --no-cache-dir --break-system-packages \
    packaging \
    schwifty==2024.4.0 \
    pycountry \
    python-stdnum

USER odoo
