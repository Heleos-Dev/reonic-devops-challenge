FROM public.ecr.aws/lambda/python:3.9

ARG LAMBDA_TASK_ROOT=/var/task

WORKDIR ${LAMBDA_TASK_ROOT}

COPY helloworld.py ${LAMBDA_TASK_ROOT}

CMD [ "helloworld.lambda_handler" ]
