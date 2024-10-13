from robot.api.deco import library, keyword
import json
from pathlib import Path
@library
class Common:
    @keyword
    def get_data_from_Json_File(self, json_file_path):
        try:
            # Ensure that the path is resolved relative to this script's directory
            json_file = Path(__file__).parent.parent/ json_file_path

            # Resolve to an absolute path and open the file
            json_file = json_file.resolve()

            with open(json_file, 'r') as file:
                data = json.load(file)
            return data
        except ValueError as e:
            print(f"Error reading the JSON file: {e}")
            return None
        except FileNotFoundError as e:
            print(f"File not found: {e}")
            return None




