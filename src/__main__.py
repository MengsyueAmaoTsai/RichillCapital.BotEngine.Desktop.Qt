
try:
    print("Starting application...")

except Exception as exception:
    print(f"Unexpected error.\n{exception}")
finally:
    print("Shutdown complete.")
