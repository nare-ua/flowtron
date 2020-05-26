ARG FROM_IMAGE_NAME=nvcr.io/nvidia/pytorch:20.03-py3
FROM ${FROM_IMAGE_NAME}

ADD ./requirements.txt /workspace
WORKDIR /workspace
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install google-colab
RUN pip install --upgrade "jupyter_http_over_ws>=0.0.7" && \
  jupyter serverextension enable --py jupyter_http_over_ws
RUN pip install ipywidgets && \
  jupyter nbextension enable --py widgetsnbextension
WORKDIR /workspace/flowtron
