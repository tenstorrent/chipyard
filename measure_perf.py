import os
import subprocess
import csv
import argparse

def get_pc_from_elf(file_name, label):
    cmd = f"nm {file_name} | grep {label}"
    try:
        result = subprocess.check_output(cmd, shell=True).decode('utf-8')
        pc_value = result.split()[0]
        return pc_value[-8:]
    except subprocess.CalledProcessError:
        return "NA"

def get_cycle_from_log(log_file, pc_value):
    cmd = f"cat {log_file} | grep 'PC=0x{pc_value}'"
    try:
        result = subprocess.check_output(cmd, shell=True).decode('utf-8')
        cycle = result.split("<")[1].split(">")[0]
        return cycle
    except subprocess.CalledProcessError:  # grep found nothing
        return "NA"

def main(perf_tests_path, logs_path, output_file):
    log_files = [f for f in os.listdir(logs_path) if f.endswith('.log')]
    
    with open(output_file, "w", newline="") as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(["Test Name", "Start Cycle", "End Cycle"])
        
        for log in log_files:
            test_base_name = os.path.splitext(log)[0]
            elf_path = os.path.join(perf_tests_path, f"{test_base_name}.elf")
            exe_path = os.path.join(perf_tests_path, f"{test_base_name}.exe")

            if os.path.exists(elf_path):
                test_path = elf_path
            elif os.path.exists(exe_path):
                test_path = exe_path
            else:
                writer.writerow([test_base_name, "NA", "NA"])
                continue

            start_pc = get_pc_from_elf(test_path, "perf_start")
            end_pc = get_pc_from_elf(test_path, "perf_end")
            
            log_file_path = os.path.join(logs_path, log)
            start_cycle = get_cycle_from_log(log_file_path, start_pc)
            end_cycle = get_cycle_from_log(log_file_path, end_pc)

            writer.writerow([test_base_name, start_cycle, end_cycle])

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Measure the performance of a simulation.")
    parser.add_argument("--perf_tests_path", required=True, help="Path to the performance tests.")
    parser.add_argument("--logs_path", required=True, help="Path to the logs.")
    parser.add_argument("--output", default="output.csv", help="Path and name of the output CSV file. Default is output.csv.")
    
    args = parser.parse_args()

    main(args.perf_tests_path, args.logs_path, args.output)

