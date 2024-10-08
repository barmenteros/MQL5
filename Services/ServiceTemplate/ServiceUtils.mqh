//+------------------------------------------------------------------+
//|                                                  ServiceTemplate |
//|                                 Copyright © 2024, barmenteros FX |
//|                                          https://barmenteros.com |
//+------------------------------------------------------------------+
#ifndef __SERVICE_UTILS_MQH__
#define __SERVICE_UTILS_MQH__

// Utility functions for services

// Constants for logging format
const int LOG_TIME_FORMAT = TIME_DATE | TIME_MINUTES | TIME_SECONDS;
const int MILLISECONDS_IN_SECOND = 1000;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void LogServiceStart(const string svcName)
{
    printf("%s [%s]: Service started at %s", __FUNCTION__, svcName, TimeToString(TimeCurrent(), LOG_TIME_FORMAT));
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void LogServiceStop(const int iterCount, const string svcName)
{
    printf("%s [%s]: Service is stopping after %d iterations.", __FUNCTION__, svcName, iterCount);
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ShouldContinue(const int maxIter)
{
    return !IsStopped() && (maxIter == -1 || iterationCount < maxIter);
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ExecuteTask(const bool logsEnabled, const int currentIteration, const string svcName)
{
    if (logsEnabled) {
        printf("%s [%s]: Executing task iteration %d at %s", __FUNCTION__, svcName, currentIteration + 1, TimeToString(TimeCurrent(), LOG_TIME_FORMAT));
    }
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SleepForNextIteration(const int interval)
{
    Sleep(interval * MILLISECONDS_IN_SECOND);  // Convert seconds to milliseconds
}

#endif  // __SERVICE_UTILS_MQH__
