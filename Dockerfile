FROM registry.redhat.io/rhel9/php-80@sha256:b0a351dd93955ef48d033b77dfc10521d03197e1ea6972621922a8b1baf05560

# Add application sources
ADD ./src .

# Install the dependencies
RUN TEMPFILE=$(mktemp) && \
    curl -o "$TEMPFILE" "https://getcomposer.org/installer" && \
    php <"$TEMPFILE" && \
    ./composer.phar install --no-interaction --no-ansi --optimize-autoloader

CMD /usr/libexec/s2i/run