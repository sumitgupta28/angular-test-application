FROM centos/s2i-base-centos7

# This image provides a S2I builder image for Angular applications running inside nginx web container.

LABEL summary="Platform for building and running Angular applications" \
      io.k8s.description="OpenShift S2I builder image for Angular apps using Angular CLI and nginx." \
      io.k8s.display-name="Angular S2I nginx" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,angular" \
      com.redhat.dev-mode="DEV_MODE:false" \
      com.redhat.deployments-dir="/opt/app-root/src" \
      com.redhat.dev-mode.port="DEBUG_PORT:5858" \
      docker.io.image="klmcwhirter/angular-s2i-nginx"

EXPOSE 8080

# This image will be initialized with "npm run $NPM_RUN"
# See https://docs.npmjs.com/misc/scripts, and your repo's package.json
# file for possible values of NPM_RUN
ENV NPM_CONFIG_LOGLEVEL=info \
  NPM_CONFIG_PREFIX=$HOME/.npm-global \
  PATH=$HOME/node_modules/.bin/:$HOME/.npm-global/bin/:$PATH \
  DEBUG_PORT=5858 \
  NODE_ENV=production \
  DEV_MODE=false

# Install nginx and nodejs from www.softwarecollections.org

# 1. Install a package with repository for your system:
# On CentOS, install package centos-release-scl available in CentOS repository:
# On RHEL, enable RHSCL repository for you system:
# sudo yum-config-manager --enable rhel-server-rhscl-7-rpms
# 2. Install the collection:
# 3. Start using the software collection:

RUN yum install -y deltarpm && \
    yum update -y && \
    yum install -y centos-release-scl && \
    yum install -y epel-release && \
    yum install -y rh-nginx112 rh-nodejs8 && \
    yum install -y jq && \
    yum clean all -y && \
    rm -rf /var/cache/yum

# Copy the S2I scripts from the specific language image to $STI_SCRIPTS_PATH
COPY ./s2i/bin/ $STI_SCRIPTS_PATH
COPY ./contrib/ /opt/app-root

# In order to drop the root user, we have to make some directories world
# writeable as OpenShift default security model is to run the container under random UID.
RUN sed -i -f /opt/app-root/etc/nginxconf.sed /etc/opt/rh/rh-nginx112/nginx/nginx.conf && \
    mkdir -p /var/opt/rh/rh-nginx112/log/nginx && \
    mkdir -p /var/opt/rh/rh-nginx112/lib/nginx/tmp/proxy && \
    chown -R 1001 /var/opt/rh/rh-nginx112 && \
    find /var/opt/rh/rh-nginx112 -type d -exec chmod 777 {} \; && \
    chown -R 1001 /opt/app-root
USER 1001

# Set the default CMD to print the usage of the language image
CMD $STI_SCRIPTS_PATH/usage