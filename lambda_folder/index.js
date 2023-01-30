/// shebang nodejs
/// intended to be a dummy node js function
/// written by sebistj, 26/01/23
/// last updated: 26/01/23

/// changelog:
/// [✓] created...
/// [x] implented...

/**
 * Dummy Lambda Function 
 * Basic framework for nodejs lambda function
 * 
 * @param   {module} DynamoDBClient     dynamoDB client SDK
 * @param   {module} QueryCommand       unused Query Command
 * @param   {module} ScanCommand        Scan Command Use
 * @return  {function}  lambda  invokes function
 * 
 * @author  sebistj
 * @version 1.0
 */
const { DynamoDBClient, QueryCommand, ScanCommand } = require("@aws-sdk/client-dynamodb"); // CommonJS import

/**
 * Exports handler Function
 * Handles nodejs Lambda function using a try-catch statement
 * 
 * @param   {json}  event   Post/Get event parameter
 * @return  {json}  output  REST Post/Get  
 * @throws  {404}   exception
 * @throws  {xxx}   exception
 *
 * @author  sebistj
 * @version 1.0
 */
exports.handler = async (event) => {

    try {

        console.log(event);

        let body = event.body;

        console.log(body);

        let bodyJSON = JSON.parse(body);

        console.log(bodyJSON);

        //let username = bodyJSON.username; //username param - maybe not required?
        
        /**
         * table parameters
         * Parameters & Configuration for the table
         * 
         * @param {Table}  petalert-lost        Dynamodb table identifier
         * @param {String} sk                   sort key identifier
         * @param {String} username             User profile identifier
         * @param {String} petID                pet id identifier
         * @param {String} petname              pet name identifier
         * @param {String} lost_desc            Lost Pet Alert description 
         * @return {dynamodb params} petalert-lost
         * 
         * @author  sebistj
         * @version 1.0
         */
        const params = {
            TableName: "petalert-lost",
            ProjectionExpression:   "username, \
                                    sk, \
                                    petID, \
                                    petname, \
                                    lost_desc",
        };
        
        const client = new DynamoDBClient({ region: "ap-southeast-1" });    // production client - singapore 
        
        let command = new ScanCommand(params);      // ScanCommand - unfiltered scan, can with filter (for search)
        
        const res = await client.send(command);     // result value

        console.log(res);           // log result -
        console.log(res.Items);     // log result items

        let petList = res.Items;    // pet list is of items
        
        
        let username = JSON.stringify(petList.username);
        let petID = JSON.stringify(petList.petID);
        
        console.log("username:" + username);
        
        console.log("petID:" + petID);
        
        
        const filterExpression = 'begins_with(SK, :sk) and begins_with(PK, :username)';
        
        const expressionAttributeValues = {
            ':sk': {S: 'petID'},
            ':username': {S: 'username'}
        };


        
        /**
         * detail petdata-dev-II parameters
         * Parameters & Configuration for the table
         * 
         * @param {Table}  petdata-dev-II       Dynamodb table identifier
         * @param {String} username             User profile identifier
         * @param {String} sk                   pet id identifier
         * @param  ...
         * @param petName 
         * @param color
         * @param coatLength
         * @param microchip
         * @param neutered
         * @param feedingSchedule
         * @param energyLevel
         * @param canBeLeftAlone
         * @param toiletBreak
         * @param periodicMaintenance
         * @param measurement
         * @param estrousCycle
         * @param petPhotoID
         * @return {dynamodb params} petdata-dev-II
         * 
         * @author  sebistj
         * @version 1.1
         */
        const params_info = {
            TableName: "petdata-dev-II",
            FilterExpression: filterExpression,
            ExpressionAttributeValues: expressionAttributeValues
            
            // KeyConditionExpression: "username = :username AND petID = :petID",
            // ExpressionAttributeValues: { 
            //     ":username": { "S": username },
            //     ":petID": { "S": petID} 
            // },
            // ConditionExpression: "attribute_not_exists(username) AND attribute_not_exists(petID) ",
            // may comment 'ProjectionExpression' out to return all info
            // ProjectionExpression: 
            // "petName, color, coatLength, microchip, neutered, feedingSchedule, \
            // energyLevel, canBeLeftAlone, toiletBreak, periodicMaintenance, \
            // measurement, estrousCycle, petPhotoID",
        };
        
    
        
        //let command_info = new ScanCommand(params_info);
        
        //const res_info = await client.send(command_info);

        // console.log(res_info);
        // console.log(res_info.Items);
        
        // let petdetail_object = res_info.Items;
        
        
        /// COMMENTED OUT 26/01/23 - pet detail will call id from this call
        

        let allPetList = {  
            //"pet_details": petdetail_object,
            "lost_pets": petList
                        
            
        }; // list pet response

        let response;   // response value

        /**
         * 200 Status Code
         * Passing Result
         * 
         * @param {Number} res.$metadata.httpStatusCode Containing the HTTP Status Code
         * @param {Struct} allPetList                   Containing the parameter response
         * @return {json}  response                     Json response
         * 
         * @author sebistj
         * @version 1.1
         */
        if (res.$metadata.httpStatusCode == 200) {
            response = {
                statusCode: 200,
                "isBase64Encoded": false,
                "headers": { "Access-Control-Allow-Origin": "*" },
                //body: JSON.stringify(petList),      //unremoved
                body: JSON.stringify(allPetList),     //removed 17/01/22
            };
            return response;
        }
        
        /**
         * !200 Status Code
         * Failure Result
         *
         * @param {Number} res.$metadata.httpStatusCode Containing the HTTP Status Code
         * @return {json}  response                     Json response
         * 
         * @author sebistj
         * @version 1.1
         */
        else {
            throw response;
            
            // LEGACY CODE : TO BE ADDED
            
            //  else if (res.$metadata.httpStatusCode != 200) {
            // response = {
            //     statusCode: res.$metadata.httpStatusCode,
            //     "isBase64Encoded": false,
            //     "headers": { "Access-Control-Allow-Origin": "*" },
            //     body: JSON.stringify("add pet alert FAIL"),
            // };
            // return response;
            // }
            
        }

    }
    /**
    * 456 Status Code
    * Error Exception Result
    * @param {Error} err           Containing error value
    * @return {json}  errResp      Error Json response
    * 
    * @author sebistj
    * @version 1.1
    */
    catch (err) {
        console.log("Error", err);

        const errResp = {
            //statusCode: err.$metadata.httpStatusCode,
            statusCode: 456,
            "isBase64Encoded": false,
            "headers": { "Access-Control-Allow-Origin": "*" },
            body: JSON.stringify(err.__type),
        };
        return errResp;

    }
    finally {

    }
};
