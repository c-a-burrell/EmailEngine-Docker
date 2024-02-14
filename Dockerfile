FROM postalsys/emailengine:v2
CMD ["run","-p 3000:3000", "--env EENGINE_REDIS='redis://localhost:6379'", "postalsys/emailengine:v2"]

