#ifndef SERVICE_H
#define SERVICE_H

extern "C" {
    void start_service();
    void get_usage(double* cpu, double* ram);
}

#endif // SERVICE_H
