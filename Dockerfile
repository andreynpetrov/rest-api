FROM public.ecr.aws/lambda/python:3.10
 
WORKDIR "${LAMBDA_TASK_ROOT}"
 
COPY ./requirements.txt "${LAMBDA_TASK_ROOT}"

RUN pip install --no-cache-dir --upgrade -r ./requirements.txt
 
COPY ./app "${LAMBDA_TASK_ROOT}"

CMD ["main.handler"]
