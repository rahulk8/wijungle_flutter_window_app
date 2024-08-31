#include "service.h"
#include <windows.h>
#include <pdh.h>

void get_usage(double* cpu, double* ram) {
    PDH_HQUERY cpuQuery;
    PDH_HCOUNTER cpuTotal;
    PDH_FMT_COUNTERVALUE counterVal;

    PdhOpenQuery(NULL, NULL, &cpuQuery);
    PdhAddCounter(cpuQuery, "\\Processor(_Total)\\% Processor Time", NULL, &cpuTotal);
    PdhCollectQueryData(cpuQuery);
    Sleep(1000);
    PdhCollectQueryData(cpuQuery);
    PdhGetFormattedCounterValue(cpuTotal, PDH_FMT_DOUBLE, NULL, &counterVal);
    *cpu = counterVal.doubleValue;

    MEMORYSTATUSEX memInfo;
    memInfo.dwLength = sizeof(MEMORYSTATUSEX);
    GlobalMemoryStatusEx(&memInfo);
    *ram = (memInfo.ullTotalPhys - memInfo.ullAvailPhys) * 100.0 / memInfo.ullTotalPhys;

    PdhCloseQuery(cpuQuery);
}

void start_service() {
    // Windows service setup (optional, for background running)
}
