import os
import subprocess
root_path = os.path.abspath(os.path.dirname(os.path.abspath(__file__)))


def run(command):
    """
    To run all the test cases
    :return:
    """
    subprocess.run(command, shell=True)


if __name__ == "__main__":

    test_command = "python3 -m pytest -s " + os.path.join(root_path, "test_cases.py::TestCases::test_get_homepage")
                  # " --html=" + os.path.join(root_path, "report_output", "buy_this_space_testing_report.html")
    run(test_command)
