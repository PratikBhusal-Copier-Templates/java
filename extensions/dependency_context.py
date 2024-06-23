from copier_templates_extensions import ContextHook
import tomllib


class ContextUpdater(ContextHook):
    def hook(self, context):
        with (
            context["_copier_conf"]["src_path"]
            / "dependency-tracking"
            / "java"
            / "gradle"
            / "libs.versions.toml"
        ).open("rb") as f:
            return {
                f"_{key.replace('-', '_')}_version": value
                for key, value in tomllib.load(f)["versions"].items()
            }
