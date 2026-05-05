# This Dockerfile matches the deploy workflow, including social cards and
# deploy-only MkDocs plugins.
FROM ubuntu

WORKDIR /docs

RUN apt update -y
RUN apt install -y libcairo2-dev libfreetype6-dev libffi-dev libjpeg-dev libpng-dev libz-dev python3-pip python3 git
RUN pip install tzdata
RUN pip install "mkdocs-material[imaging]>=9.7.0"
RUN pip install mkdocs-minify-plugin
RUN pip install mkdocs-awesome-pages-plugin
RUN pip install mkdocs-redirects
RUN pip install mkdocs-git-revision-date-localized-plugin
RUN pip install mkdocs-git-committers-plugin-2
RUN pip install mkdocs-rss-plugin
RUN pip install --use-pep517 mkdocs-glightbox

RUN git config --global --add safe.directory /docs &&\
    git config --global --add safe.directory /site

EXPOSE 8000

ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]
