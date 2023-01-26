echo -n "Input secret:"
read secret
docker run      -p 5001:5001     -e SYNCSERVER_PUBLIC_URL=https://sync.firefox.cocogoat.moe     -e SYNCSERVER_SECRET="$secret"     -e SYNCSERVER_SQLURI=sqlite:////tmp/syncserver.db     -e SYNCSERVER_BATCH_UPLOAD_ENABLED=true     -e SYNCSERVER_FORCE_WSGI_ENVIRON=false     -e SYNCSERVER_DEBUG_ENABLED=true     -e PORT=5001   --name syncserver  syncserver:latest
