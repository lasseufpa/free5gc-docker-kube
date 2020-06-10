MONGO_IP=$1

export DB_URI=mongodb://$1:27017/free5gc
npm run dev &>/dev/null &

