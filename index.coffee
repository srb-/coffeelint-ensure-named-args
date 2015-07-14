module.exports = class EnsureNamedArgs

    rule:
        name: 'ensure_named_args'
        level : 'error'
        message : 'Function called without naming each argument'
        description: """
            This rule prohibits calling a function without first naming each argument.
            """

    tokens: ['CALL_START']


    # return true if error found
    lintToken : (token, tokenApi) ->
        #console.log '\n\nIN rule!!!, return true if error is found\n'

        callStarts = 0
        argsWithoutName = 0
        i = 1

        done = false
        allArgumentsNamed = true

        while(not done)

            token = tokenApi.peek(i)?[0]
            #console.log token
            if not token? then done = true


            if callStarts is 0
                # We are not in any embedded function calls, so valid

                if token is 'CALL_END'
                    allArgumentsNamed = if argsWithoutName is 0 then true else false
                    done = true
                else
                    argsWithoutName++ if i is 1 # corner case for single argument
                    argsWithoutName++ if token is ','
                    argsWithoutName-- if token is '='


            # skip over recursive call starts - linter will get it later
            callStarts++ if token is 'CALL_START'
            callStarts-- if token is 'CALL_END'

            i = i + 1

        #console.log not allArgumentsNamed
        #return not allArgumentsNamed # if false then error
        if not allArgumentsNamed
            return { context: "#{argsWithoutName} argument(s) not named" }
        else
            return null


