## Dockerfile for generic vim 7.4.
FROM paullamar3/docker-debian-plus:v0.2.1
MAINTAINER Paul LaMar <pal3@outlook.com>

# Set the language to support UTF-8
ENV LANG     C.UTF-8

# Install Vim
RUN p_addpkgs vim git tree

# Copy the default vimrc and plugin manager for root user
COPY vimrc     /root/.vimrc
COPY plug.vim  /root/.vim/autoload/

# Add the vim user
RUN p_adduser vim Vim

# Copy the default vimrc and plugin manager for vim user
COPY vimrc /home/vim/.vimrc
COPY plug.vim  /home/vim/.vim/autoload/
COPY entrypoint.sh /home/vim/

# Put us in the vim user home folder
WORKDIR /home/vim/
# Change the owner from 'root' to 'vim' for the copied files
RUN chown -R vim .vim .vimrc entrypoint.sh

# Switch to vim user
USER vim

# Specify default git user and email
RUN git config --global user.name "Vim" && git config --global user.email "vim@dummy.aaa"

# Install the plugins for Vim
RUN vim -c "PlugInstall|q|q"

ENTRYPOINT ["/home/vim/entrypoint.sh"]

