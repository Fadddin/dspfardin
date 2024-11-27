import path from "path";
import fs from "fs";
import archiver from "archiver";

export async function GET() {
    const publicFolderPath = path.resolve("./public");

    if (!fs.existsSync(publicFolderPath)) {
        return new Response("Public folder not found", {
            status: 404,
            headers: {
                "Access-Control-Allow-Origin": "*",
                "Access-Control-Allow-Methods": "GET, OPTIONS",
            },
        });
    }

    // Create a readable stream for the response
    const archive = archiver("zip", { zlib: { level: 9 } });

    // Set up the headers for ZIP response
    const headers = new Headers({
        "Content-Type": "application/zip",
        "Content-Disposition": 'attachment; filename="public-files.zip"',
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "GET, OPTIONS",
    });

    // Stream directly to the client
    const stream = new ReadableStream({
        start(controller) {
            archive.on("data", (chunk) => controller.enqueue(chunk));
            archive.on("end", () => controller.close());
            archive.on("error", (err) => controller.error(err));
        },
    });

    // Append files and finalize the archive
    archive.directory(publicFolderPath, false);
    await archive.finalize();

    return new Response(stream, { headers });
}
