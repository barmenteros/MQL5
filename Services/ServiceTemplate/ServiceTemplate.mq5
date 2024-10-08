//+------------------------------------------------------------------+
//|                                              ServiceTemplate.mq5 |
//|                                 Copyright © 2024, barmenteros FX |
//|                                          https://barmenteros.com |
//+------------------------------------------------------------------+
#property service

#include "ServiceUtils.mqh"

// Input parameters to customize the behavior of the service
input int    intervalSeconds = 60;           // Time interval between task executions (in seconds)
input int    maxIterations   = 10;           // Maximum number of iterations (-1 for unlimited)
input bool   showLogs        = true;         // Whether to print logs in the console
input string serviceName     = "ServiceTemplate"; // Name of the service

// Global variables
int iterationCount = 0;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnStart()
{
    LogServiceStart(serviceName);

    while (ShouldContinue(maxIterations)) {
        ExecuteTask(showLogs, iterationCount, serviceName);
        iterationCount++;

        // Immediately stop if maxIterations is reached
        if (iterationCount >= maxIterations && maxIterations != -1) {
            break;
        }

        SleepForNextIteration(intervalSeconds);
    }

    LogServiceStop(iterationCount, serviceName);
}
//+------------------------------------------------------------------+
