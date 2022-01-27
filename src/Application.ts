const http = require('http');

const si = require('systeminformation');
const { resourceLimits } = require('worker_threads');

const hostname = 'localhost';
const port = 8080;

const result=[];

Promise.all([

    // CPU
    si.cpu(function(data) {
       result.push(data);
    }),

    // Memo
    si.mem(function(data) {
        result.push(data);
    }),

    //OS
    si.osInfo(function(data) {
    result.push(data);
    }),

    //currentLoad 
    si.currentLoad(function(data) {
        result.push(data);
    }),

    //diskLayout Information
    si.diskLayout(function(data) {
    result.push(data);
    }),

    //current
    si.networkInterfaces(function(data) {
        result.push(data);
    })
    ]).then((result) =>{

        //console.log(result);

    });

const requestListner = async function(req, res) {
    // const sysinfo = await getSysInfo();
    if(req.url != '/api/v1/sysinfo'){
        res.writeHead(200,'{"Content-Type: application/json"}');
        return res.end('404 Not Found!');
    }
    else{
        res.writeHead(200,'{"Content-Type: application/json"}');
        return res.end(JSON.stringify(result))
    }
};

const server = http.createServer(requestListner);


server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/api/v1/sysinfo`);
    });
 